cd $WORKSPACE/greetings-maven/2.13.0

export PROFILES=-Ptycho_snapshots,xtext_snapshots
export SETTINGS="-s $WORKSPACE/settings.xml"
export DISABLE_DOWNLOAD_PROGRESS=-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn 

mvn $DISABLE_DOWNLOAD_PROGRESS $SETTINGS $PROFILES clean install
