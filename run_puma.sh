#!/bin/bash
if test $# -lt 1 ; then
 echo "usage: command [arg_list]"; exit
fi
cmd=$1; shift;  args=$*
tasks=1
sfile=BE502_$(date +%N).slurm
echo "#!/bin/bash">$sfile
echo "#SBATCH -A windfall --partition=windfall">>$sfile
echo "#SBATCH -J BE502_$(whoami)_job" >>$sfile
echo "#SBATCH -N $tasks --mem=5gb">>$sfile
echo "#SBATCH -t 4:00:00">>$sfile
echo "module load R python/3.6">>$sfile
echo "srun -n $tasks $cmd $args" >>$sfile
sbatch $sfile

