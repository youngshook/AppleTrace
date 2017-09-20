CATAPULT="catapult/"

python merge.py -d tracedata
${CATAPULT}tracing/bin/trace2html tracedata/trace.json --output=tracedata/trace.html && open tracedata/trace.html