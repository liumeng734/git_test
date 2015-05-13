package com.rainbow.financial.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.financial.dao.FinancialDao;
import com.rainbow.financial.po.CustomerWinningDetail;
import com.simple.bsp.common.util.DBUtil;
import com.simple.bsp.common.util.DataGridModel;

@Repository("financialDao")
public class FinancialDaoImpl implements FinancialDao{

	@Autowired
	private DBUtil util;
	@Override
	public Map<String, Object> queryCustomerWinningDetail(DataGridModel dgm,
			CustomerWinningDetail customerWinningDetail, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("hello kitty");
		String totalSql = "select sum(lottery_buy_detail.win_money_no_with_tax) as totalMoney from users , lottery_buy_detail where users.id = lottery_buy_detail.user_id";
		Map<String, Object> result = new HashMap<String, Object>();
		StringBuffer sumSql = new StringBuffer();
		sumSql.append("select count(*) from users u, lottery_buy_detail lbd, scheme s, lottery_type lt,  lottery l"
				+ " where 1=1 and u.id = lbd.user_id and lbd.scheme_id = s.id and s.lottery_id = l.id ");
		String quSql = "select u.name, u.reality_name, lbd.id, date_format(lbd.datetime,'%Y-%m-%d%   %H:%i:%S') as datetime, lbd.user_id, lbd.share, lbd.can_quash, lbd.quashed,"
				+ " lbd.win_money_no_with_tax, date_format(s.datetime,'%Y-%m-%d%   %H:%i:%S') as scheme_datetime, s.title as title, s.description as description,"
				+ " s.initiate_user_id, s.isuse_id, s.lottery_id as lottery_ID, s.lottery_number, s.multiple, s.money, s.assure_money,"
				+ " s.is_system_quashed, s.lottery_buyed, s.lottery_code, s.win_money, s.win_commission, s.win_description, "
				+ " s.at_top_application, s.at_top, s.at_win_affiche, s.secrecy_level, s.buy_operator_id, s.win_operator_id, "
				+ " s.scheme_is_open, l.name as lottery_name, l.lottery_type_id, lt.name as lottery_type_name "
				+" from users u, lottery_buy_detail lbd, scheme s, lottery_type lt,  lottery l"
				+" where 1=1 and u.id = lbd.user_id and lbd.scheme_id = s.id and s.lottery_id = l.id and l.lottery_type_id = lt.id";
		Map<String, Object> params = new HashMap<String, Object>();
		StringBuffer sqlSb = new StringBuffer();
		if(!("").equals(customerWinningDetail.getName()) && customerWinningDetail.getName() != null){
			sqlSb.append(" and u.name like :name");
			params.put("name","%"+customerWinningDetail.getName()+"%");
			sumSql.append(" and u.name like '%").append(customerWinningDetail.getName()).append("%'");
		}
		if(!("").equals(customerWinningDetail.getLottery_ID()) && customerWinningDetail.getLottery_ID() != 0){
			sqlSb.append(" and s.lottery_id like :lottery_id");
			params.put("lottery_id", "%" + customerWinningDetail.getLottery_ID() + "%");
			sumSql.append(" and s.lottery_id like '%").append(customerWinningDetail.getLottery_ID()).append("%'");
		}
		if(!("").equals(customerWinningDetail.getStartTime()) && customerWinningDetail.getStartTime() != null){
			sqlSb.append(" and lbd.datetime >'" + customerWinningDetail.getStartTime() +"'");
			sumSql.append(" and lbd.datetime >'" + customerWinningDetail.getStartTime() +"'");
		}
		if(!("").equals(customerWinningDetail.getEndTime()) && customerWinningDetail.getEndTime() != null){
			sqlSb.append(" and lbd.datetime <'" + customerWinningDetail.getEndTime() +"'");
			sumSql.append(" and lbd.datetime <'" + customerWinningDetail.getEndTime() +"'");
		}
		if(!("").equals(customerWinningDetail.getStartWinMoneyNoWithTax()) && customerWinningDetail.getEndWinMoneyNoWithTax() != null){
			sqlSb.append(" and lbd.win_money_no_with_tax >'" + customerWinningDetail.getStartWinMoneyNoWithTax() +"'");
			sumSql.append(" and lbd.win_money_no_with_tax >'" + customerWinningDetail.getStartWinMoneyNoWithTax() +"'");
		}
		if(!("").equals(customerWinningDetail.getEndWinMoneyNoWithTax()) && customerWinningDetail.getEndWinMoneyNoWithTax() != null){
			sqlSb.append(" and lbd.win_money_no_with_tax <'" + customerWinningDetail.getEndWinMoneyNoWithTax() +"'");
			sumSql.append(" and lbd.win_money_no_with_tax <'" + customerWinningDetail.getEndWinMoneyNoWithTax() +"'");
		}
		//组装排序规则
		String orderString = "";
		if(StringUtils.isNotBlank(dgm.getSort())){
			orderString = " order by u." + dgm.getSort() + " " + dgm.getOrder();
		}
		//组装分页定义
		String pageString = " limit "+(dgm.getPage() - 1) * dgm.getRows() + ", " + dgm.getRows();
						
		//System.out.println("["+sumSql.toString()+"]");
		//System.out.println("["+quSql + sqlSb.toString() + orderString + pageString+"]");
		Map<String, Object> map1 = new HashMap<String, Object>();
		CustomerWinningDetail customerTotalMoney = (CustomerWinningDetail) util.getObject(totalSql, new HashMap<String, Object>(), CustomerWinningDetail.class);
		//System.out.println("totalWinMoney=" + customerTotalMoney.getTotalMoney());
		map1.put("totalWinMoney", customerTotalMoney.getTotalMoney().toString());
		request.getSession().setAttribute("map1", map1);
		//绑定查询结果('total'和'rows'名称不能修改)
		result.put("total", util.getObjCount(sumSql.toString()));
		result.put("rows", util.getMapList(quSql + sqlSb.toString() + orderString + pageString, params));
		return result;
	}

}
