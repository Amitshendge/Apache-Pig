%default INPUT '/home/amit/practise/pig/assignment/CpuLogData2019-09-21.csv'
%default OUTPUT '/home/amit/practise/pig/assignment/output/cleandata21'
data = load '$INPUT' using PigStorage(',');
main_data = foreach data generate $39 as boot:chararray,$40 as mail:chararray,$41 as keyboard:int;
store main_data into '$OUTPUT';
