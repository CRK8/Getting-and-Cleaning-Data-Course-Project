## This is the code book for the `tidy.txt` dataset that will describe the variables, the data, and any transformations or work performed to clean up the data.

The following datasets were imported from the Samsung data:
- `features` - list of types of sensor data created
- `activity_labels` - list of the 6 different exersizes and their corresponding factor
- `X_test` - sensor data from "test" observations
- `y_test` - data that indicates activity for "test" observations 
- `subject_test` - data that indicates subject for "test" observations
- `X_train` - sensor data from "train" observations
- `y_train` - data that indicates activity for "train" observations
- `subject_train` - data that indicates subject for "train" observations

`activity_labels` were added to the `X_test` and `X_train` data on import
`test` and `train` datasets were created with the first column as the subject, and a merge of the `y_test/train` and `activity_labels` dataset to describe the activity performed
mean and standard deviation columns were extracted from the 'X_test/train' datasets and then added to the respective 'test/train' data
`test` and `train` were then `merged`

to create the tidy dataset, `ddply` was applied on the first to rows to create means for the rest of the data
a `tidy.txt` file was written with the results
