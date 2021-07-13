
echo "**********************************************************************************"

appName="vishuhanda001-gmail.com/demoandroid-appcenter"
deviceSetName="itsvishuhanda-gmail.com/demo_one_device"
testSeriesName="AppiumTestSeries"
# token="de6c86f9a15d5644fe7512541d1c181bfd9c1d17"
token="588ee653c54ef42ba9204951ddbced2fddd0f69b"
buildDir="target/upload"
appcenter = $APPCENTER_OUTPUT_DIRECTORY
echo "appcenteroutput" appcenter




echo "cloning repo"
git clone https://github.com/vishuhanda/browserstacknewappium.git
echo "cloning done"
cd browserstacknewappium
echo "navigated to directory"
echo "running test cases"
# mvn clean install -Dsuitexml=testng.xml -Dbrowserstackurl=bs://08760d3f8668615030d376a1f755544a4e027df3
if [ $? -eq 0 ]; then
    echo "Maven Build successfully made"
    echo "distributing app"
    appcenter distribute release --app $appName --file $APPCENTER_OUTPUT_DIRECTORY/*.apk --group "betatesters" --token $token
    echo "app distributed"
else
    echo "Build Failed"
fi

