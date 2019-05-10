for j in {1..10}
do
        for i in {1..10}
        do
                sh run_sample_cyc.sh "a/=i" "a+=i" "div_add" "${i}" "${j}"
        done
done
