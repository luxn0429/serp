/**
 * 
 */
package net.loyin.model.plan;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.loyin.jfinal.anatation.TableBind;
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
 * 种植表
 *
 */
@TableBind(name = "plan_plant")
public class Plant extends Model<Plant> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7954780971060482049L;
	
	public static final String tableName = "plan_plant";
	public static final Plant dao = new Plant();
	
	/**
	 * 分页查询
	 * @param pageNo		页数
	 * @param pageSize		每页展示数量
	 * @param filter		查询条件
	 * @return				种植计划
	 */
	public Page<Plant> pageGrid(int pageNo, int pageSize,Map<String, Object> filter) {
		List<Object> parame=new ArrayList<Object>();
		StringBuffer sql=new StringBuffer(" from ");
		sql.append(tableName);
		sql.append(" t left join ");
		sql.append(Person.tableName);
		sql.append(" p on p.id=t.head_id");
		
		String keyword=(String)filter.get("keyword");
		if(StringUtils.isNotEmpty(keyword)){
			sql.append(" and (t.name like ? or t.variety like ? or p.realname like ?)");
			keyword="%"+keyword+"%";
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
		return this.paginate(pageNo, pageSize, "select t.*,p.realname as username,p.mobile as mobile ",sql.toString(),parame.toArray());
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
	public Plant findById(String id,String company_id){
		StringBuffer sql=new StringBuffer("select t.*,p.realname as username,p.mobile as mobile from ");
		sql.append(tableName);
		sql.append(" t left join ");
		sql.append(Person.tableName);
		sql.append(" p on t.head_id=p.id ");
		sql.append(" where t.id=? and t.company_id=? ");
		return dao.findFirst(sql.toString(),id,company_id);
	}

}
