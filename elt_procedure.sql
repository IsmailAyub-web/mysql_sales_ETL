CREATE DEFINER=`root`@`localhost` PROCEDURE `etl_sales`()
BEGIN
  declare exit handler for sqlexception
	  begin
		rollback;
		signal sqlstate '45000' set message_text='An error occured during etl_sales';
	  end;

	start transaction;

	insert into fact_table (Country , ItemType , sales_channel ,Order_date,OrderId , Units_cost, Total_Revenue , Total_cost, Total_profit)
	select  Country , ItemType , sales_channel ,Order_date,OrderId, Units_cost, Total_Revenue , Total_cost, Total_profit
	from tempdata;

	truncate table tempdata;
	commit;
END