package com.caller.components;

public class AdminDashBoardController {
	DailySummaryStatusController dailySummaryStatusController = new DailySummaryStatusController();
	DailySummaryTypeController dailySummaryTypeController = new DailySummaryTypeController();
	public DailySummaryStatus dailySummaryStatus ;
	
	public AdminDashBoardController() {
		//dailySummaryStatus = dailySummaryStatusController.dailyStatusProcessor(null);
	}
}
