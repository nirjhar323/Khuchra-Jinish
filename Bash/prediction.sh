#Bash script to take new SMR parameter result file(specified by time stamp), modify its upper bound and lower bound and 
copy it to the model prediction directory and subsequently run model prediction.

#! /bin/bash
echo "Enter time stamp"
read time_stamp
echo "Enter upper bound"
read u_bound
echo "Enter lower bound"
read l_bound



echo "BayesParameterResults_${time_stamp}.txt"
string1="BayesParameterResults_"
string2=".txt"

filename="$string1$time_stamp$string2"

echo "$filename" 

cp /home/nirjhar/Desktop/SMR_multi_state_discrepancy_variable_theta_latest/results/$filename /home/nirjhar/Desktop/SMR_multi_state_discrepancy_variable_theta_latest/src_variable_theta_old/disrepancy_prediction

#Do mysterious sed stuff
find plot_config.txt -type f -exec sed -i  "s/t_stamp/$time_stamp/g" {} \;
find plot_config.txt -type f -exec sed -i  "s/u_bound/$u_bound/g" {} \;
find plot_config.txt -type f -exec sed -i  "s/l_bound/$l_bound/g" {} \;

#Change directory to model predcition program
cd home/nirjhar/Desktop/SMR_multi_state_discrepancy_variable_theta/src_variable_theta_old/disrepancy_prediction


#Run model prediction program
./test_optimized 
