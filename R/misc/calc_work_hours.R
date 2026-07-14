
# install.packages("BusinessDuration")

calc_work_hours <- function(strt,
                            end,
                            unit_inpt = "hour",
                            wknd_inpt = c("Friday", "Saturday", "Sunday")) {
      
      # Formulate standard R POSIXlt timestamps
      start_dt <- strptime(strt, "%Y-%m-%d %H:%M:%S") # "2025-06-23 08:00:00"
      end_dt   <- strptime(end,  "%Y-%m-%d %H:%M:%S") # "2025-09-05 17:00:00"
      
      # July 4 & 5, 2026 are Saturday and Sunday
      biz_hours <- BusinessDuration::businessDuration(
            startdate   = start_dt,
            enddate     = end_dt,
            starttime   = "08:00:00",  # Daily business start hour
            endtime     = "16:00:00",  # Daily business end hour
            weekendlist = wknd_inpt,
            unit        = unit_inpt
      )
      
      print(biz_hours)
      
}
