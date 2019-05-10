SampleRate=$6
HomeDir=../
CodeName="${HomeDir}/function_function.c"
logDirName="${HomeDir}/sampleLogIns/function_function/"
TempCFile="${HomeDir}/test.c"
appDir="${HomeDir}/appDir/function_function"
objDumpDir="${HomeDir}/ObjDump/sampleLogIns/function_function/"
cp ${CodeName} ${TempCFile}
pos=23
function1OperationNum=$4
function2OperationNum=$5
Operation1=$1
Operation2=$2
AppNameShort=$3
for i in $(seq 1 1 ${function1OperationNum})
do
        sedMesseger="17 a \\\t ${Operation1};"
        sed -i "${sedMesseger}" ${TempCFile}
        #let pos=$((pos+1))
        pos=$(expr ${pos} + 1)
done
for i in $(seq 1 1 ${function2OperationNum})
do
        sedMesseger="${pos} a \\\t ${Operation2};"
        sed -i "${sedMesseger}" ${TempCFile}
done
AppName=${AppNameShort}_${function1OperationNum}_${function2OperationNum}_sameLength_test
echo "Collecting ${function1OperationNum}_${function2OperationNum}th samples ${AppName}_skid_${SampleRate} ${pos}"
gcc -g ${TempCFile} -o ${appDir}/${AppName}
objdump -S --disassemble ${appDir}/${AppName} > temp.dump
cat temp.dump | grep "  40" > ${objDumpDir}/${AppName}.loop.objdump
/home/haoxu/tools/hpctoolkit/install/bin/hpcrun -e PAPI_TOT_INS@${SampleRate} ${appDir}/${AppName} > ${logDirName}/${AppName}_skid_${SampleRate}
rm -r ./hpctoolkit-${AppName}*
