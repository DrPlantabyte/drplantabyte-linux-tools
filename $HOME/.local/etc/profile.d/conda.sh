# activate conda environment if anaconda or miniconda is installed

DEFAULT_ENV="base"

MINICONDA_PATH="$HOME/miniconda3"
ANACONDA_PATH="$HOME/anaconda3"
if [ -d "$MINICONDA_PATH" ] ; then
	CONDA_PATH="$MINICONDA_PATH"
elif [ -d "$ANACONDA_PATH" ] ; then
	CONDA_PATH="$ANACONDA_PATH"
fi

# >>> conda initialize >>>
__conda_setup="$($CONDA_PATH/bin/conda "shell.$(basename "$SHELL")" 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate
conda activate "$DEFAULT_ENV"

