#Students
Students = read.csv("C:/Personal/Students.csv",stringsAsFactors = FALSE)
#Teachers
Teachers = read.csv("C:/Personal/Teachers.csv",stringsAsFactors = FALSE)
#Family
Students_Family = read.csv("C:/Personal/StudentsFamily.csv",stringsAsFactors = FALSE)

#Merged Student & Teachers
Students_Teachers = merge(Students,Teachers[,c("TeacherFname","TeacherLname")])

#Merged Student & Family Info
StudFamilyDataframe = merge(Students_Family, Students, by=1:1)

#individual filters
x = Students_Teachers[which(Students_Teachers$Marks>50),]
y = Students_Teachers[which(Students_Teachers$Gender=='F'),]
# Multiple Filters "And" & "Or" operators
zAND = Students_Teachers[which(Students_Teachers$Gender!='F' & Students_Teachers$Marks<50),]
zOR = Students_Teachers[which(Students_Teachers$Gender=='F' | Students_Teachers$Marks>50),]
#--------

# StudFamilyDataframe
#ROW SLICE
StuentSearch = StudFamilyDataframe[which(StudFamilyDataframe$Firstname=='Sally'),]

#Column Slicing
StuentSearch = StudFamilyDataframe[c("Firstname","Surname","Marks")]


#Extra Predictive Criterias
PropectiveLoanCandidates = 
  StudFamilyDataframe[which(StudFamilyDataframe$UndergraduateGPA>=3.5 
                            & StudFamilyDataframe$CriminalBackground=='no'),]






