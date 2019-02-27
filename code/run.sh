#validate argument count
if [ "$#" -ne 4 ]; then
  echo "Illegal number of parameters."
  exit

#validate dataset file
elif [ ! -f $1 ]; then
  echo "Dataset file (arg1) not found."
  exit

#validate annotation file
elif [ ! -f $2 ]; then
  echo "Annotation file (arg2) not found."
  exit
fi

#python3 data.generate.py $1 $2 slow_anal.out \'$3\' \'$4\'

#validate slow_anal.out was produced
if [ ! -f 'slow_anal.out' ]; then
  echo "The expected output from data.generate.py cannot be found."
  exit
fi

Rscript boxplot_two_tissue.R $3 $4
