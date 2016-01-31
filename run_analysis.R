# Your working directory should be set to the directory containing the 
# test and train directories. 

library(data.table)
library(dplyr)

# 1 Load and combine the datasets --------------------------------------------------

# Start by loading in the features.txt file to use for column headers for the X table
colnames = read.table("features.txt", header = FALSE)

# Load in the training data, and label the the first two columns as subjects and activities 
test <- cbind(
  read.table("./test/subject_test.txt", header = FALSE, col.names = "subjects"),
  read.table("./test/y_test.txt", header = FALSE, col.names = "activities"),
  read.table("./test/X_test.txt", header = FALSE, col.names = colnames$V2)
  )

# Now do the same for the training data
train <- cbind(
  read.table("./train/subject_train.txt", header = FALSE, col.names = "subjects"),
  read.table("./train/y_train.txt", header = FALSE, col.names = "activities"),
  read.table("./train/X_train.txt", header = FALSE, col.names = colnames$V2)
)

# And now combine those two datasets
fulldf <- rbind(train, test)

# 2 Extract just the mean and std deviation ---------------------------------------
# Also include the subject and activity codes
subdf <- fulldf[, grepl("subjects|activities|*mean*|*std*", names(fulldf))]

# 3 Change activity codes to descriptive names ------------------------------------

# we'll do this one at a time, using activity_labels.txt as a guide
subdf$activities <- sub("1","walking", subdf$activities)
subdf$activities <- sub("2", "walking-upstairs", subdf$activities)
subdf$activities <- sub("3", "walking-downstairs", subdf$activities)
subdf$activities <- sub("4", "sitting", subdf$activities)
subdf$activities <- sub("5", "standing", subdf$activities)
subdf$activities <- sub("6", "laying", subdf$activities)

# 4 Appropriately label the dataset with descriptive variable names ----
# The columns are already labeled informatively from step 1, but here we will
# do some editing so that they are slightly more informative, and easier to use.
# Getting rid of special characters, and ensuring that they are all in lower case. 

# start by making all characters lower case
colnames(subdf) <- tolower(names(subdf))

# now take out the special character "."
colnames(subdf) <- sub("\\.", "", names(subdf))

# there is an addition "..." in many names; remove this as well
colnames(subdf) <- sub("\\...", "", names(subdf))

# and finally, a few still have ".."
colnames(subdf) <- sub("\\..", "", names(subdf))

# Create a new dataset with only one value for each subject/variable pair (average) ----
finalDT <- subdf %>% group_by(subjects, activities) %>% summarise_each(funs(mean))
