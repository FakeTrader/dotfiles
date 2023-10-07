# LTS: jdk 8, 11, 17, 21

jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}
alias jdk8="jdk 1.8"
alias jdk11="jdk 11"
alias jdk17="jdk 17"
alias jdk21="jdk 21"

# Default java 1.8
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Ubuntu
# sudo update-alternatives --config java

# Recommendation
# Eclipse Temurin Java Development Kit (former AdoptOpenJDK)
# (https://adoptium.net/)

# export JAVA_8_HOME=`/usr/libexec/java_home -v 1.8`
# export JAVA_11_HOME=`/usr/libexec/java_home -v 11`
# export JAVA_17_HOME=`/usr/libexec/java_home -v 17`
# export JAVA_21_HOME=`/usr/libexec/java_home -v 21`
# export JAVA_HOME=$JAVA_17_HOME

# alias jdk8="export JAVA_HOME=$JAVA_8_HOME"
# alias jdk11="export JAVA_HOME=$JAVA_11_HOME"
# alias jdk17="export JAVA_HOME=$JAVA_17_HOME"
# alias jdk21="export JAVA_HOME=$JAVA_21_HOME"

# Homebrew
# For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn $(brew --prefix)/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk
# sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# sudo ln -sfn $(brew --prefix)/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
# sudo ln -sfn $(brew --prefix)/opt/openjdk@21/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
