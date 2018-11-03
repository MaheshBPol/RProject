# num1 = NA
# num2 = 5
# is.na(num1)
# is.na(num2)
# is.nan(num1)
# is.nan(num2)

Students = read.csv("C:/Personal/Students.csv",stringsAsFactors = FALSE)
#Students
Teachers = read.csv("C:/Personal/Teachers.csv",stringsAsFactors = FALSE)
#Teachers
Students_Teachers = merge(Students,Teachers[,c("TeacherFname","TeacherLname")])
#Students_Teachers
#Students_Teachers[1:100,c("Firstname","Surname","DoB","Gender","Year","Marks","TeacherFname","TeacherLname")]

x = Students_Teachers[which(Students_Teachers$Marks>50),]
summary(x$Marks)

#install.packages("sqldf")
#install.packages("googleVis")
library(sqldf)
library(googleVis)
Students = read.csv("C:/Personal/Students.csv",stringsAsFactors = FALSE)
#Students
Teachers = read.csv("C:/Personal/Teachers.csv",stringsAsFactors = FALSE)

Students_Teachers = sqldf("Select a.*,b.TeacherFname,b.TeacherLname from 
      Students a  left outer join 
              Teachers b on (a.Class=b.Class)")
#Students_Teachers
#head(Students_Teachers)
class_av_age = 
  sqldf("Select class,AVG(Case when Gender = 'M' then Marks end) as Avg_Male
,AVG(Case when Gender = 'F' then Marks end) as Avg_FeMale
 from   Students_Teachers group by 1")
class_av_age
g = gvisLineChart(class_av_age,xvar="Class",yvar = c("Avg_FeMale","Avg_Male"),
                  options = list(title="Average Age Trends Male Vs Female"))
plot(g)



Car_Prices = read.csv("C:/Personal/car_values_kuiper.csv",stringsAsFactors = FALSE)
m = lm(Price ~ Mileage + Type + as.factor(Cylinder), data =Car_Prices )
names(m)
summary(m)
people = c("Mahesh","reyansh","Neel","Nimmi")
people[people %in% c("Mahesh","reyansh","Neel","Nimmi")]
#people
people[grepl("^N",x = people)]

Car_Prices[grepl("^Sedan",x = Car_Prices)]
ls()
rm("Car_Prices")
rm(list = ls()[grepl("Students",ls())])
rm(list=ls())
plot(Car_Prices$Mileage,Car_Prices$Price)
plot(Car_Prices$Mileage,Car_Prices$Price)



         