
echo "**********************************************************************************"

appName="itsvishuhanda-gmail.com/app-android"
deviceSetName="itsvishuhanda-gmail.com/demo_one_device"
testSeriesName="AppiumTestSeries"
token="de6c86f9a15d5644fe7512541d1c181bfd9c1d17"
buildDir="target/upload"



echo "cloning repo"
git clone https://github.com/vishuhanda/browserstacknewappium.git
echo "cloning done"
cd browserstacknewappium
echo "navigated to directory"
echo "running test cases"
mvn clean install -Dsuitexml=testng.xml
if [ $? -eq 0 ]; then
    echo "Maven Build successfully made"
    echo "distributing app"
    appcenter distribute release --app $appName --file $APPCENTER_OUTPUT_DIRECTORY/*.apk --group "betatesters" --token $token
    echo "app distributed"
else
    echo "Build Failed"
fi

