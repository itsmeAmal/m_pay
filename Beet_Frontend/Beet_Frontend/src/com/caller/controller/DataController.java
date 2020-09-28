package com.caller.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.caller.TransactionAll;
import com.caller.controller.DatabaseController;


public class DataController {
	
public List<TransactionAll> getTransactions(int set1){
		
		
		List<TransactionAll> listtrans = new ArrayList<TransactionAll>();
		PreparedStatement statement;
		Connection con = null;
		Statement st = null;
		
		String SQL = "SELECT * FROM transactions_all LIMIT "+set1+","+10+"";
		
		
		
		System.out.println(SQL);
		
		
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);
			
			//statement.setString(1, Accountno);
			
			ResultSet rs = statement.executeQuery();
			System.out.println(SQL);
			System.out.println("work work ");

			while (rs.next()) {
				
				TransactionAll userDataDisplay = new TransactionAll();
				
				userDataDisplay.setId(rs.getInt("id"));
				userDataDisplay.setAmount(rs.getDouble("amount"));
				userDataDisplay.setBalanceAmount(rs.getDouble("balance_amount"));
				userDataDisplay.setDate(rs.getString("date"));
				userDataDisplay.settId(rs.getString("t_id"));
				
				  userDataDisplay.setTransactionTypesId(rs.getInt("transaction_types_id"));
				  userDataDisplay.setUserAccNo(rs.getString("user_acc_no"));
				  userDataDisplay.setStatus(rs.getString("status"));
				  userDataDisplay.setDescription(rs.getString("description"));
				  userDataDisplay.setEntry(rs.getString("entry"));
				 
				
				listtrans.add(userDataDisplay);
				
				System.out.println(listtrans);
			}
			
			//System.out.println(user.getAddress());
			//System.out.println(user.getDob());
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		
		return listtrans;

}

}