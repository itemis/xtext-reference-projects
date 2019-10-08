cd $WORKSPACE/integrationtests

export SETTINGS="-s $WORKSPACE/settings.xml"
export DISABLE_DOWNLOAD_PROGRESS=-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn 

mvn $DISABLE_DOWNLOAD_PROGRESS $SETTINGS -Dtycho.showEclipseLog=true clean install -Dtest=XtendExamplesTest
