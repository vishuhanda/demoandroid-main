
echo "**********************************************************************************"

appName="vishuhanda001-gmail.com/demoandroid-appcenter"
deviceSetName="itsvishuhanda-gmail.com/demo_one_device"
testSeriesName="AppiumTestSeries"
token="588ee653c54ef42ba9204951ddbced2fddd0f69b"
buildDir="target/upload"



echo "Source directory: $APPCENTER_SOURCE_DIRECTORY"
echo "Output directory: $APPCENTER_OUTPUT_DIRECTORY/*.apk"
echo "        App Name: $appName"
echo "      Device Set: $deviceSetName"
echo "     Test Series: $testSeriesName"
echo "       API_token: $token"
echo "       API_token: $buildDir"
echo



echo "cloning repo"
git clone https://github.com/vishuhanda/appiumappcenter.git
echo "cloning done"
cd appiumappcenter
echo "navigated to directory"
echo "navigated to directory"
mvn -DskipTests -P prepare-for-upload package 
echo "uploading test cases"
echo "Running app center"
# appcenter test run appium --app  $appName --devices $deviceSetName --app-path $APPCENTER_OUTPUT_DIRECTORY/*.apk --test-series $testSeriesName  --locale "en_US" --token $token --build-dir $PWD/target/upload


# appcenter distribute release --app $appName --file $APPCENTER_OUTPUT_DIRECTORY/*.apk --group "betatesters" --token $token




mvn clean install -Dsuitexml=testng.xml 
if [ $? -eq 0 ]; then
    echo "Maven Build successfully made"
    echo "distributing app"
    appcenter distribute release --app $appName --file $APPCENTER_OUTPUT_DIRECTORY/*.apk --group "betatesters" --token $token
    echo "app distributed"
else
    echo "Build Failed"
fi

