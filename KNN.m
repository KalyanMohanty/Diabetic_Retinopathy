clear
close all
clc
load c
load dwt_hist_class
load dwt_hist_data

data1=dwt_hist_data;
class1=dwt_hist_class;

%per=60;
%c=cvpartition(class,'HoldOut',1-(per/100));

Mdl=fitcknn(data1(c.training,:),class1(c.training));
obtained=predict(Mdl,data1(~c.training,:));
EVAL = Evaluate(class1(~c.training,:)',obtained');
disp('KNN classification dwt results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);


load stat_class
load stat_data

data2=stat_data;
class2=stat_class;

Mdl2=fitcknn(data2(c.training,:),class2(c.training));
obtained2=predict(Mdl2,data2(~c.training,:));
EVAL = Evaluate(class2(~c.training,:)',obtained2');
disp('KNN classification stat results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);
