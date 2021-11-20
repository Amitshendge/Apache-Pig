data16 = load '/home/amit/practise/pig/assignment/output/Detailed/Details16/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);
data17 = load '/home/amit/practise/pig/assignment/output/Detailed/Details17/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);
data18 = load '/home/amit/practise/pig/assignment/output/Detailed/Details18/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);
data19 = load '/home/amit/practise/pig/assignment/output/Detailed/Details19/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);
data20 = load '/home/amit/practise/pig/assignment/output/Detailed/Details20/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);
data21 = load '/home/amit/practise/pig/assignment/output/Detailed/Details21/part-r-00000' as (mail:chararray,total:float,idel:float,working:float);


data_all = UNION data16, data17, data18, data19, data20, data21;

A = group data_all by $0;

B = foreach A generate group,COUNT(data_all);

J = join A by $0, B by $0;

C = foreach J generate A::group,SUM(data_all.total),$3;

D = foreach J generate A::group,SUM(data_all.idel),$3;

E = foreach J generate A::group,SUM(data_all.working),$3;

avg_total = foreach C generate $0,$1/$2/60;

avg_idel = foreach D generate $0,$1/$2/60;

avg_working = foreach E generate $0,$1/$2/60;

store avg_total into '/home/amit/practise/pig/assignment/output/Average_data/avg_total';
store avg_idel into '/home/amit/practise/pig/assignment/output/Average_data/avg_idel';
store avg_working into '/home/amit/practise/pig/assignment/output/Average_data/avg_working';










