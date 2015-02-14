/**
 * 
 */
package net.loyin.model.plan;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.loyin.jfinal.anatation.TableBind;
import net.loyin.model.crm.Customer;
import net.loyin.model.sso.Person;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * @author luxiangning
 *
 */
@TableBind(name = "plan_material")
public class Material extends Model<Material> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 799300070802646953L;
	
	public static final String tableName="plan_material";
	public static Material dao = new Material();
	
	/**
	 * 分页查询
	 * @param pageNo		页数
	 * @param pageSize		每页展示数量
	 * @param filter		查询条件
	 * @return				种植计划
	 */
	public Page<Material> pageGrid(int pageNo, int pageSize,Map<String, Object> filter) {
		List<Object> parame=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer(" from ");
		sql.append(tableName);
		sql.append(" t left join ");
		sql.append(Customer.tableName);
		sql.append(" c on t.buy_company_id = c.id left join ");
		sql.append(Person.tableName);
		sql.append(" p on p.id=c.head_id");
		
		String start_date=(String) filter.get("start_date");
		if(StringUtils.isNotEmpty(start_date)){
			sql.append(" and t.create_datetime >= ?");
			parame.add(start_date+" 00:00:00");
		}
		String end_date=(String) filter.get("end_date");
		if(StringUtils.isNotEmpty(end_date)){
			sql.append(" and t.create_datetime <= ?");
			parame.add(end_date+" 23:59:59");
		}
		
		String keyword=(String)filter.get("keyword");
		if(StringUtils.isNotEmpty(keyword)){
			sql.append(" and (t.name like ? or t.variety like ? or c.name like ?)");
			keyword="%"+keyword+"%";
			parame.add(keyword);
			parame.add(keyword);
			parame.add(keyword);
			parame.add(keyword);
		}
		String company_id=(String)filter.get("company_id");
		if(StringUtils.isNotEmpty(company_id)){
			sql.append(" and t.company_id=? ");
			parame.add(company_id);
		}
		String sortField=(String)filter.get("_sortField");
		if(StringUtils.isNotEmpty(sortField)){
			String sort=(String)filter.get("_sort");
			sql.append(" order by ");
			sql.append(sortField);
			sql.append(" ");
			sql.append(sort);
		}
		return this.paginate(pageNo, pageSize, "select t.*,c.name as factory_name,p.realname as username,p.mobile as usermobile ",sql.toString(),parame.toArray());
	}
	
	/**
	 * 删除
	 * @param id			记录ID
	 * @param company_id	公司ID
	 */
	@Before(Tx.class)
	public void del(String id,String company_id){
		if (StringUtils.isNotEmpty(id)) {
			String[] ids=id.split(",");
			StringBuffer ids_=new StringBuffer();
			List<String> parame=new ArrayList<String>();
			for(String id_:ids){
				ids_.append("?,");
				parame.add(id_);
			}
			ids_.append("'-'");
			parame.add(company_id);
			Db.update("delete  from " + tableName + " where id in ("+ids_.toString()+ ") and company_id=? ",parame.toArray());
		}
	}
	/**
	 * 通过ID得到一条记录
	 * @param id			记录ID
	 * @param company_id	公司ID
	 * @return				一条记录
	 */
	public Material findById(String id,String company_id){
		StringBuffer sql=new StringBuffer("select t.*,c.name as factory_name,p.realname as username,p.mobile as usermobile  ");
		sql.append(tableName);
		sql.append(" t left join ");
		sql.append(Customer.tableName);
		sql.append(" c on t.buy_company_id=c.id left join");
		sql.append(Person.tableName);
		sql.append(" p on c.head_id=p.id where t.id=? and t.company_id=? ");
		return dao.findFirst(sql.toString(),id,company_id);
	}

}
