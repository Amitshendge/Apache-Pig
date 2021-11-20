%default INPUT '/home/amit/practise/pig/assignment/output/cleandata/cleandata21/part-m-00000'
%default OUTPUT '/home/amit/practise/pig/assignment/output/Uniqueuser/Uniqueuser21'
data = load '$INPUT' as (boot:chararray,mail:chararray,keyboard:int);
grpd = group data by mail;
unique = foreach grpd generate group;
store unique into '$OUTPUT';
