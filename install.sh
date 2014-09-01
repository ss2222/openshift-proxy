git clone https://github.com/ss2222/openshift-proxy.git
cd openshift-proxy

#nohup sh -c "python $OPENSHIFT_HOMEDIR/app-root/runtime/repo/trash/t2/PythonProxy.py" >    $OPENSHIFT_LOG_DIR/proxy_run.log 2>&1 &
nohup sh -c "python PythonProxy.py" >    $OPENSHIFT_LOG_DIR/proxy_run.log 2>&1 &
tail -f $OPENSHIFT_LOG_DIR/proxy_run.log
#stop
#kill -9 `lsof -t -i :15000`
