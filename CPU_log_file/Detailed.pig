%default INPUT '/home/amit/practise/pig/assignment/output/cleandata/cleandata21/part-m-00000'
%default OUTPUT '/home/amit/practise/pig/assignment/output/Detailed/Details21'

data = load '$INPUT' as (boot:chararray,main:chararray,keyboard:float);

grpd = group data by main;

count = foreach grpd generate group,COUNT(data);

idel = filter data by keyboard == 0;

grpdidel = group idel by main;

countidel = foreach grpdidel generate group,COUNT(idel);

full_join = join count by $0 FULL OUTER, countidel by $0;

out = foreach full_join generate $0,($1-$3);

full_join2 = join full_join by $0 FULL OUTER, out by $0;

detailed = foreach full_join2 generate $0,$1*5,$3*5,$5*5;

store detailed into '$OUTPUT';
