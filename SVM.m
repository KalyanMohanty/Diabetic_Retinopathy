clear
close all
clc
load c
load dwt_hist_class
load dwt_hist_data

data3=dwt_hist_data;
class3=dwt_hist_class;

svmStruct = fitcsvm(data3(c.training,:),class3(c.training));
SVMModel = predict(svmStruct,data3(~c.training,:));
EVAL = Evaluate(class3(~c.training,:)',SVMModel');

disp('SVM classification dwt results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);

load stat_class
load stat_data

data4=stat_data;
class4=stat_class;

svmStruct2 = fitcsvm(data4(c.training,:),class4(c.training));
SVMModel = predict(svmStruct2,data4(~c.training,:));
EVAL = Evaluate(class4(~c.training,:)',SVMModel');

disp('SVM classification stat results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);
