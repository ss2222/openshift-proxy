#git clone https://github.com/ss2222/openshift-proxy.git
#cd openshift-proxy
if [[ `lsof -n -P | grep 15000` ]];then
	kill -9 `lsof -t -i :15000`
	lsof -n -P | grep 15000
fi
if [[ `lsof -n -P | grep 8080` ]];then
	kill -9 `lsof -t -i :8080`
	lsof -n -P | grep 8080
fi
#nohup sh -c "python $OPENSHIFT_HOMEDIR/app-root/runtime/repo/trash/t2/PythonProxy.py" >    $OPENSHIFT_LOG_DIR/proxy_run.log 2>&1 &
nohup sh -c "python PythonProxy.py --port 15000" >    $OPENSHIFT_LOG_DIR/proxy_run-15000.log 2>&1 &
tail -f $OPENSHIFT_LOG_DIR/proxy_run_15000.log
nohup sh -c "python PythonProxy.py --port 8080" >    $OPENSHIFT_LOG_DIR/proxy_run_8080.log 2>&1 &
tail -f $OPENSHIFT_LOG_DIR/proxy_run_8080.log
#stop
#kill -9 `lsof -t -i :15000`
