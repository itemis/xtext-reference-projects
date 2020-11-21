cd greetings-maven/2.20.0

export PROFILES=-Ptycho_snapshots,xtext_snapshots
export SETTINGS="-s $WORKSPACE/settings.xml"
export DISABLE_DOWNLOAD_PROGRESS=-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn 

mvn -f org.xtext.example.mydsl.parent/pom.xml $DISABLE_DOWNLOAD_PROGRESS $SETTINGS $PROFILES clean install
