package net.loyin.model.plan;

import com.jfinal.plugin.activerecord.Model;
/**
 * 
 * @author luxiangning
 * 养殖表
 */
public class Breed extends Model<Breed> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4437807997760099669L;
	
	public static final String tableName = "plan_breed";
	public static Breed dao = new Breed();

}
