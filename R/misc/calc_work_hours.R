
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


# National service
calc_work_hours(strt = "2011-11-01 08:00:00",
                end  = "2012-11-01 16:00:00",
                wknd_inpt = c("Friday", "Saturday"))

# 
calc_work_hours(strt = "2013-05-02 08:00:00",
                end  = "2014-05-02 16:00:00",
                wknd_inpt = c("Friday", "Saturday"))

# 
calc_work_hours(strt = "2014-12-01 08:00:00",
                end  = "2015-03-01 16:00:00",
                wknd_inpt = c("Friday", "Saturday"))

# Teaching assistant
calc_work_hours(strt = "2015-09-01 08:00:00",
                end  = "2017-08-30 16:00:00",
                wknd_inpt = c("Friday", "Saturday"))


## Dental Assistant Experience

# Everett
calc_work_hours(strt = "2025-06-23 08:00:00",
                end  = "2025-09-05 16:00:00")

# Bellevue
calc_work_hours(strt = "2026-04-15 08:00:00",
                end  = Sys.time())
