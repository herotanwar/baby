BIDA Practicals
Prac1 a) Import the data warehouse data in Microsoft excel and create the pivot table and pivot chart
-Create a table in excel (sr no, name, subjects 3)
-Create pivot table(
Select the table-insert-pivot table(select all the checkboxes)

b) Import the cube in Microsoft excel and create the pivot table and pivot chart to perform analysis
-Make 3 tables(name, subject)
-Select each table and make the pivot table 
-Select the each table and paste it in 1 sheet
-Select the first table-copy and then paste(image paste)
-Select the image-format-picture effects-3D rotation

Prac2:- Apply the what-if analysis for data visualization. Design and generate necessary reports based on the data warehouse data. Use Excel
-Make the table from the question
-Find sum :
=SUM(n1*n2+n3*n4)
-Data—WhatIF analysis—Scenario Manager—Add-(Scenario name-Select cell-Scenario Value)

Pract3:- Perform the data classification using classification algorithm using R/Python
Code:-
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

iris = load_iris()
x = iris.data
y = iris.target

x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=0.2, random_state=42
)

scalar = StandardScaler()
x_train = scalar.fit_transform(x_train)
x_test = scalar.transform(x_test)

svm = SVC(kernel='rbf', C=1)
svm.fit(x_train, y_train)

y_pred = svm.predict(x_test)

accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy:.3f}')   # ❌ Syntax error below
print('Classification Report')
print(classification_report(y_test, y_pred))

print('Confusion Matrix')
print(confusion_matrix(y_test, y_pred))

Prac4:- Perform the data clustering using clustering algorithm using R/Python
Code:-
import numpy as np
import matplotlib.pyplot as plt
from sklearn.datasets import make_blobs
from sklearn.cluster import KMeans

n_samples = 300
n_clusters = 4
random_state = 42

X, y_true = make_blobs(
    n_samples=n_samples,
    centers=n_clusters,
    cluster_std=0.60,
    random_state=random_state
)

kmeans = KMeans(n_clusters=n_clusters, random_state=random_state)
y_kmeans = kmeans.fit_predict(X)

plt.figure(figsize=(8,6))
plt.scatter(X[:,0], X[:,1], c=y_kmeans, s=50, cmap='viridis')
centers = kmeans.cluster_centers_
plt.scatter(centers[:,0], centers[:,1], c='red', s=200, alpha=0.75, marker='X')

plt.title('K-means clustering')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.grid()
plt.show()

Prac5:- Perform the linear regression on the given data warehouse data using R/Python
Code:
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
import matplotlib.pyplot as plt

data = {
    'Feature1': [1.2, 2.3, 3.1, 4.2, 5.3],
    'Feature2': [3.4, 4.5, 5.2, 6.1, 7.0],
    'Target': [5.6, 6.7, 7.3, 8.4, 9.2]
}

df = pd.DataFrame(data)
X = df[['Feature1', 'Feature2']]
y = df['Target']

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.4, random_state=42
)

model = LinearRegression()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)

mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

print(f'Mean Squared Error:{mse:.2f}')
print(f'R-Squared:{r2:.2f}')

plt.scatter(y_test, y_pred)

plt.xlabel('Actual Values')
plt.ylabel('Predicted Values')
plt.title('Linear Regression')   
plt.show()

Prac6:- Perform the logistic regression on the given data warehouse data using R/Python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import matplotlib.pyplot as plt

# Create dataset
data = {
    'Feature1': [1.2, 4.5, 9.6, 8.3, 5.0, 4.5],
    'Feature2': [7.1, 4.5, 8.6, 9.5, 3.8, 7.5],
    'Target':   [0, 0, 1, 1, 1, 0]
}

Df = pd.DataFrame(data)

# Split features and target
x = Df[['Feature1', 'Feature2']]
y = Df['Target']

# Train-test split
x_train, x_test, y_train, y_test = train_test_split(
    x, y, test_size=0.2, random_state=42
)

# Train Logistic Regression model
model = LogisticRegression(max_iter=1000)
model.fit(x_train, y_train)

# Predictions
y_pred = model.predict(x_test)

# Evaluation
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy:.3f}')
print('Classification Report:')
print(classification_report(y_test, y_pred))
print('Confusion Matrix:')
print(confusion_matrix(y_test, y_pred))

# Visualization
plt.title('Logistic Regression')
plt.scatter(x_test['Feature1'], x_test['Feature2'], c=y_pred, cmap='viridis')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.show()

Prac7:- Write a python program to read data from a CSV file, perform simple data and analysis and generate basic insights. (Use Pandas is a Python library)
-Create excel table (sr no, name, phone number, email)
-Save the excel sheet (desktop—csv, delimited)
-Write the code
-File upload from the saved desktop csv file
-Code:-
import pandas as pd

def load_data(csv_file):
  try:
    data = pd.read_csv(csv_file)
    return data
  except FileNotFoundError:
    print("File not found")
    return None
  except pd.errors.EmptyDataError:
    print("No data found")
    return None
  except pd.errors.ParserError:
    print("An error occurred: {e}")
    return None

def analyze_data(data):
  print("First few rows of data")
  print(data.head())

  print("Data types of each column")
  print(data.dtypes)

  print("Summary statistics of data")
  print(data.describe())

  print("Counts of missing values in each column")
  print(data.isnull().sum())

  print("Unique values in each column")
  for column in data.columns:
    print(f"{column}: {data[column].nunique()}")

def main():
  csv_file = "/content/Book2.csv"
  data = load_data(csv_file)

  if data is not None:
    analyze_data(data)

if __name__ == "__main__":
  main()

-Copy the path for output

Prac8: a) Perform data visualization using Python on any sales data
-Make the excel table (month, product A, product B, product C, total sales[ add the all 3 product and write the submission to the total sales])
-Save the file CSV(comma deblted)
-Upload the excel sheet
-Code:
from matplotlib.lines import lineStyles
import pandas as pd
import matplotlib.pyplot as plt

Data = pd.read_csv("/content/Book1.csv")
df = pd.DataFrame(data)
df.columns = df.columns.str.strip() 
df.set_index('Month',inplace=True)


plt.figure(figsize = (10,6))
plt.plot(df.index, df['Product A'], label = 'Product A')
plt.plot(df.index, df['Product B'], label = 'Product B')
plt.plot(df.index, df['Product C'], label = 'Product C')
plt.plot(df.index, df['Total Sales'], label = 'Total Sales', linestyle = '--', marker = 'o')

plt.title('Monthly Sales Data')
plt.xlabel('Month')
plt.ylabel('Sales')


b) Perform data visualization using PowerBI on any sales data
-Make the excel table(name, roll no, phn no, email)
-Save the excel sheet CSV comma delimited
-On powerBI—select Get data---Excel—Import file—Load—Fields check boxes—Charts

Practical 9:- Decision tree
-enter the excel data make the table (name. rollno, c, c++, python)
Code:
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn import tree
import matplotlib.pyplot as plt

data = pd.read_csv("/content/Book1.csv")
data.columns = data.columns.str.strip()

X = data.drop(["C", "Name"], axis=1)
y = data["C"]

model = DecisionTreeClassifier(max_depth=3, random_state=42)
model.fit(X, y)

# 🌳 Better visualization
plt.figure(figsize=(14,9), dpi=120)
tree.plot_tree(
    model,
    feature_names=X.columns,
    class_names=[str(c) for c in sorted(y.unique())],
    filled=True,
    rounded=True,
    fontsize=10,
    impurity=False,   # removes gini for cleaner look
    proportion=True   # shows percentages instead of raw counts
)
plt.title("Decision Tree Visualization", fontsize=14)
plt.show()
