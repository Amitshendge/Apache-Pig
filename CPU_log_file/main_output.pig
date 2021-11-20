avg_total = load '/home/amit/practise/pig/assignment/output/Average_data/avg_total/part-r-00000' as (mail:chararray,avg:float);
avg_idel = load '/home/amit/practise/pig/assignment/output/Average_data/avg_idel/part-r-00000' as (mail:chararray,avg:float);
avg_working = load '/home/amit/practise/pig/assignment/output/Average_data/avg_working/part-r-00000' as (mail:chararray,avg:float);

A = ORDER avg_working BY avg ASC;

B = ORDER avg_working BY avg DESC;

C = ORDER avg_idel BY avg DESC;

low_working = LIMIT A 1;

high_working = LIMIT B 1;

high_idel = LIMIT C 1;

store low_working into '/home/amit/practise/pig/assignment/output/Main_Output/low_working';
store high_working into '/home/amit/practise/pig/assignment/output/Main_Output/high_working';
store high_idel into '/home/amit/practise/pig/assignment/output/Main_Output/high_idel';










