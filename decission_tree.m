clear
close all
clc
load c
load dwt_hist_class
load dwt_hist_data

data3=dwt_hist_data;
class3=dwt_hist_class;

mdl = fitrtree(data3(c.training,:),class3(c.training));
DTModel = predict(mdl,data3(~c.training,:));
EVAL = Evaluate(class3(~c.training,:)',DTModel');

disp('DT classification dwt results');
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

mdl2 = fitrtree(data4(c.training,:),class4(c.training));
dtModel = predict(mdl2,data4(~c.training,:));
EVAL2 = Evaluate(class4(~c.training,:)',dtModel');

disp('DT classification stat results');
disp(['accuracy     :: ' num2str(EVAL2(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL2(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL2(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL2(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL2(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL2(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL2(7)*100) ' %']);
