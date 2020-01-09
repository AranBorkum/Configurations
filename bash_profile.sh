export BASH_SILENCE_DEPRECATION_WARNING=1  

############### SETTING ALL PATHS FOR RELEVANT PROGRAMS ###############

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

#Include Path For CERN ROOT
export ROOTSYS=/usr/local/root
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$PYTHONDIR/lib:$LD_LIBRARY_PATH
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH

#Stuff for libxml things and such
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"


############### NEAT LITTLE FUNCTIONS ###############

function title {
    if [ "$#" == 0 ] ; then
	echo -ne "\033]0;"`hostname`"\007"
    else
	echo -ne "\033]0;"$*"\007"
    fi
}

############### DEFINING ALIASES FOR CONVIENIENCE ###############

CC="gcc-4.8"
CXX="g++-4.8"
ARCHFLAGS="-arch x86_64"
alias gcc="gcc-4.8"
alias g++="g++4.8"


alias root='clear ; root -l'
alias getTicket='kinit aborkum@FNAL.GOV'
alias fermilab='ssh -Y dunegpvm02'
alias fermilab1='ssh -Y aborkum@dunegpvm01.fnal.gov'
alias fermilab2='ssh -Y aborkum@dunegpvm02.fnal.gov'
alias fermilab3='ssh -Y aborkum@dunegpvm03.fnal.gov'
alias fermilab4='ssh -Y aborkum@dunegpvm04.fnal.gov'
alias fermilab5='ssh -Y aborkum@dunegpvm05.fnal.gov'
alias fermilab6='ssh -Y aborkum@dunegpvm06.fnal.gov'
alias fermilab7='ssh -Y aborkum@dunegpvm07.fnal.gov'
alias fermilab8='ssh -Y aborkum@dunegpvm08.fnal.gov'
alias buildFermilab='ssh -XY aborkum@dunebuild01.fnal.gov'
alias feynman='ssh -XY anb28@feynman.hpc.susx.ac.uk'
alias ll='clear ; ls -l'
alias l='clear ; ls'
alias lc='clear ; ls'
alias make='clear ; make'
alias ScreenShare="open vnc://localhost:5901"
alias nproc="sysctl -n hw.ncpu"
alias fnapp='sshfs aborkum@dunegpvm02.fnal.gov:/dune/app/users/aborkum /Users/aranborkum/App-Fermilab -o volname=Fermilab-App'
alias fndata='sshfs aborkum@dunegpvm02.fnal.gov:/dune/data/users/aborkum /Users/aranborkum/Data-Fermilab -o volname=Fermilab-Data'
alias feyre='sshfs anb28@feynman.hpc.susx.ac.uk:/research/epp/lbne/aran /Users/aranborkum/Research-Feynman -0 volname=Feynman-Research'
alias listmount='pgrep -lf sshfs'
alias em='emacs -nw'
alias ggd='cd /Users/aranborkum/Docterate/Projects/GeometryStuff/duneggd'
alias gegede-cli='clear && gegede-cli'
alias redOptima='ssh -L 8888:localhost:8887 borkuma@34.254.177.131'
# alias redOptima='sshfs borkuma@54.229.72.136:/home/borkuma /Users/aranborkum/Red-Optima -o volname=RedOptima'
alias jn='jupyter-notebook'

# colorful shell
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# scp function becuase typing it all out is annoying
function getfile {
    if [ "$#" != 2 ]; then
	echo Usage $(serverfile $0) locallocation
	exit 1
    fi
    SERVER_FILE=$1
    LOCAL_LOCATION=$2
    scp aborkum@dunegpvm02.fnal.gov:${SERVER_FILE} ${LOCAL_LOCATION}
}

function pushfile {
    if [ "$#" != 2 ] ; then
	echo Usage $(serverfile $0) locallocation
	exit 1
    fi

    LOCAL_FILE=$1
    SERVER_LOCATION=$2
    scp ${LOCAL_FILE} aborkum@dunegpvm02.fnal.gov:/${SERVER_LOCATION}
}
