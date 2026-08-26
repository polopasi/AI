BUILD_DIRECTORY=build
RELEASE_JAR_NAME=iaPract1

ifeq ($(OS),Windows_NT)
    SEP = ;
    RM_DIR = rmdir /S /Q
    RM_FILE = del /Q
else
    SEP = :
    RM_DIR = rm -rf
    RM_FILE = rm -f
endif

CLASSPATH=src$(SEP)src/lib/Desastres.jar$(SEP)src/lib/AIMA.jar

all: createJar

createJar: compile
	cd $(BUILD_DIRECTORY) && jar xf ../src/lib/Desastres.jar
	cd $(BUILD_DIRECTORY) && jar xf ../src/lib/AIMA.jar
	jar cfm $(RELEASE_JAR_NAME).jar src/manifest.txt -C $(BUILD_DIRECTORY) .

compile:
	javac -d $(BUILD_DIRECTORY) -cp $(CLASSPATH) src/Main.java

clean:
	-$(RM_DIR) $(BUILD_DIRECTORY)

distclean: clean
	-$(RM_FILE) $(RELEASE_JAR_NAME).jar
