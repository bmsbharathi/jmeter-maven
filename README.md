### Prerequisite DB setup

* Start Postgres DB locally in Docker container
```
docker run -it -p 5432:5432 -e POSTGRES_PASSWO  RD=test -e POSTGRES_USER=test -e POSTGRES_DB=test postgres:11.1
```
* Execute the DB script from `src/main/resources/init-db.sql` 

## To run the tests through maven plugin

#### To run all the tests
```
mvn clean verify
```

### To exclude specific tests
```
mvn clean verify -DexcludedTests=test-plan-1.jmx,test-plan.jmx
```

### To run only specific tests
```
mvn clean verify -DincludeTests=test-plan-1.jmx,test-plan-2.jmx
```

----
## About Jmeter plugin

### Running the GUI

Once you have added the plugin to your project you will be able to invoke the JMeter GUI using the following command:

```
mvn jmeter:configure jmeter:gui
```

If you want to preload a test, you can specify it on the command line:

```
mvn jmeter:configure jmeter:gui -DguiTestFile=src/test/jmeter/test.jmx
```

If you haven't added the plugin to your project you can still invoke it (provided you have a valid pom.xml in your project) by using the following:

```
mvn com.lazerycode.jmeter:jmeter-maven-plugin:configure com.lazerycode.jmeter:jmeter-maven-plugin:gui
```

### Basic Usage


### Add the plugin to your project

Add the plugin to the build section of your pom's project :

```
<plugin>
    <groupId>com.lazerycode.jmeter</groupId>
    <artifactId>jmeter-maven-plugin</artifactId>
    <version>3.3.0</version>
    <executions>
        <!-- Generate JMeter configuration -->
        <execution>
            <id>configuration</id>
            <goals>
                <goal>configure</goal>
            </goals>
        </execution>
        <!-- Run JMeter tests -->
        <execution>
            <id>jmeter-tests</id>
            <goals>
                <goal>jmeter</goal>
            </goals>
        </execution>
        <!-- Fail build on errors in test -->
        <execution>
            <id>jmeter-check-results</id>
            <goals>
                <goal>results</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

### Reference JMX files and CSV data

Once you have created your JMeter tests, you'll need to copy them to `<Project Dir>/src/test/jmeter`.  
By default this plugin will pick up all the .jmx files in that directory, you can also put data files in this folder and reference them in your plan.
To specify which tests should be run, see the [Selecting-Tests-To-Run](https://github.com/jmeter-maven-plugin/jmeter-maven-plugin/wiki/Selecting-Tests-To-Run#2) section of the Wiki.

### Run the tests

```
mvn clean verify
```

All your tests will run in maven!