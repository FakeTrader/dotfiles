# https://github.com/AdoptOpenJDK/homebrew-openjdk
# jdk 1.8
# jdk 11
jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
}
alias jdk8="jdk 1.8"
alias jdk11="jdk 11"
