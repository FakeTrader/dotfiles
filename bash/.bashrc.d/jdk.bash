# LTS
# jdk 8
# jdk 11
# jdk 17

# Recommendation
# Eclipse Temurin Java Development Kit (former AdoptOpenJDK)
# (https://adoptium.net/)

# export JAVA_8_HOME=`/usr/libexec/java_home -v 1.8`
# export JAVA_11_HOME=`/usr/libexec/java_home -v 11`
# export JAVA_17_HOME=`/usr/libexec/java_home -v 17`
# export JAVA_HOME=$JAVA_17_HOME

# alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
# alias jdk11="export JAVA_HOME=$JAVA_11_HOME"
# alias jdk17="export JAVA_HOME=$JAVA_17_HOME"

# Ubuntu
# sudo update-alternatives --config java

# Homebrew
# For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn $(brew --prefix)/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
# sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# sudo ln -sfn $(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}
alias jdk8="jdk 1.8"
alias jdk11="jdk 11"
alias jdk17="jdk 17"
