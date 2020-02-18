clear
close all
clc
load c
load dwt_hist_class
load dwt_hist_data

data=dwt_hist_data;
class=dwt_hist_class;
%per=60;

%c=cvpartition(class,'HoldOut',1-(per/100));

layer=10;
Mdl=train(patternnet(layer),data(c.training,:)',convert_labels_binary_vec(class(c.training)',numel(unique(class))));
bin=double(Mdl(data(~c.training,:)')==max(Mdl(data(~c.training,:)')));
obtained=convert_binary_id(bin);

EVAL = Evaluate(class(~c.training,:)',obtained);
disp('ANN classification  DWT results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);

load stat_class
load stat_data

data=stat_data;
class=stat_class;

layer=10;
Mdl=train(patternnet(layer),data(c.training,:)',convert_labels_binary_vec(class(c.training)',numel(unique(class))));
bin=double(Mdl(data(~c.training,:)')==max(Mdl(data(~c.training,:)')));
obtained=convert_binary_id(bin);

EVAL = Evaluate(class(~c.training,:)',obtained);
disp('ANN classification stat results');
disp(['accuracy     :: ' num2str(EVAL(1)*100) ' %']);
disp(['sensitivity  :: ' num2str(EVAL(2)*100) ' %']);
disp(['specificity  :: ' num2str(EVAL(3)*100) ' %']);
disp(['precision    :: ' num2str(EVAL(4)*100) ' %']);
disp(['recall       :: ' num2str(EVAL(5)*100) ' %']);
disp(['f_measure    :: ' num2str(EVAL(6)*100) ' %']);
disp(['gmean        :: ' num2str(EVAL(7)*100) ' %']);