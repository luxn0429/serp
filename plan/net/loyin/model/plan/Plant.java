/**
 * 
 */
package net.loyin.model.plan;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.loyin.model.crm.Contacts;
import net.loyin.model.crm.Customer;
import net.loyin.model.sso.Person;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * @author luxiangning
 * 
 * 种植表
 *
 */
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
		sql.append(" cust on cust.id=t.customer_id ");
		sql.append(" left join ");
		sql.append(" c on c.id=t.creater_id left join ");
		sql.append(" u on u.id=t.updater_id left join ");
		sql.append(" h on h.id=cust.head_id ");
		sql.append(" where 1=1 ");
		String keyword=(String)filter.get("keyword");
		if(StringUtils.isNotEmpty(keyword)){
			sql.append(" and (t.name like ? or cust.sn like ? or cust.name like ? or t.mobile like ? or t.telephone like ?)");
			keyword="%"+keyword+"%";
			parame.add(keyword);
			parame.add(keyword);
			parame.add(keyword);
			parame.add(keyword);
			parame.add(keyword);
		}
		String customer_id=(String)filter.get("customer_id");
		if(StringUtils.isNotEmpty(customer_id)){
			sql.append(" and t.customer_id=? ");
			parame.add(customer_id);
		}
		String sortField=(String)filter.get("_sortField");
		if(StringUtils.isNotEmpty(sortField)){
			String sort=(String)filter.get("_sort");
			sql.append(" order by ");
			sql.append(sortField);
			sql.append(" ");
			sql.append(sort);
		}
		return this.paginate(pageNo, pageSize, "select t.*,cust.type as custType,cust.name as customer_name,c.realname creater_name,u.realname updater_name,h.realname head_name ",sql.toString(),parame.toArray());
	}

}
