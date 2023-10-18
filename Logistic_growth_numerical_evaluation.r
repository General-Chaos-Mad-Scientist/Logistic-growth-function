{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyPCGilrrxdmsGgi7CBJ9yDq",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R"
    },
    "language_info": {
      "name": "R"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/General-Chaos-Mad-Scientist/Logistic-growth-function/blob/main/Logistic_growth_numerical_evaluation.r\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": null,
      "metadata": {
        "id": "T7plsPIFfWiF"
      },
      "outputs": [],
      "source": [
        "#code that will implement a logistic simulation of population based on -\n",
        "#given criteria. Numerical approximation of the function\n",
        "\n",
        "#defining variables\n",
        "N_0 <- 1    #starting population\n",
        "r <- 0.03    #min^-1 # rate of change\n",
        "K <- 100000     #coefficient needed for logistic function -\n",
        "#defines carrying capacity of the environment\n",
        "\n",
        "dt <- 0.01      #defining the time difference\n",
        "total_time <- 430       #time in the simulation\n",
        "number_of_steps <- round(total_time/dt, 1)\n",
        "time <- c(0)        #here the time of each step will be recorded\n",
        "N_t <- rep(0, number_of_steps)      #here the change in popultion -\n",
        "#will be recorded\n",
        "N_t[1] <- N_0       #first recording is initial population"
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "for (t in 1:number_of_steps){\n",
        "    #calculating parts of logistic equation and final equation\n",
        "    positive_change <- r*dt*N_t[t]\n",
        "    negative_change <- r*(N_t[t]/K)*N_t[t]\n",
        "    #calculate and update population record\n",
        "    N_t[t+1] <- N_t[t] + positive_change - negative_change\n",
        "    time[t+1] <- time[t]+dt     #update the time record\n",
        "}"
      ],
      "metadata": {
        "id": "RaHz9o2d_2RF"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "source": [
        "#ploting of the results\n",
        "\n",
        "plot(time, N_t,\n",
        "     t=\"l\",\n",
        "     col=\"lightblue\",\n",
        "     lwd=3,\n",
        "     xlab = \"Time [min]\",\n",
        "     ylab = \"Number of bacteria\")"
      ],
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/",
          "height": 437
        },
        "id": "cN1Nv-phIANW",
        "outputId": "3674dc22-7948-4551-dec4-f5c287d85638"
      },
      "execution_count": null,
      "outputs": [
        {
          "output_type": "display_data",
          "data": {
            "text/plain": [
              "plot without title"
            ],
            "image/png": "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\n11133S233HLLLbdMmDChrKysvLz8iSee8Pv9yX8KAKiTLER1S2v7OkmIUifBDkB7yXfstm7d\nev3115vN5okTJ77zzjvxN48fP75t27ZJkyZt3rx51KhRKS5SCEaKAch6bceIFdjNFkO3/pc5\ngKySPNgtXLiwsLDwww8/NBgMRUVF8Tfz8/N37959+eWXP/HEE3/7299SXKQQjBQDkPXansOW\ncm0CQEeSB7uPPvpo3rx5/fr1q6ura/t+QUHBfffdt2jRopTVdobujBTbuHHjqlWrzinYNTc3\nP/roox32xkvYs2fPudUKAD0tKstH3IwRA5BE8mDX3Nzc2dWEoqIij8fT0yV1rJsjxVavXn1O\nPzYcDjc0NIRCoS6+4/P5RLra9QFAh2rbjBErYowYgE50q0FxZ1tWGzduTNsIrxSNFOvTp88r\nr7zS9XeWL1/+ySefKNvGD0CWS1ybELSvA9C55M/eTpo0admyZTt27Gj7ZmNj489+9rPf//73\nkydPTlltZ2CkGICsFYrGjnlbg53ZoCtgjBiATkhJTxjr6urGjBlTW1t7ySWX7NixY8SIEUKI\nPXv2BIPBsrKyrVu39u3bNw2FNjU1TZgwYceOHU6ns4uRYm+99ZbD4ejZP3r58uX33Xef2+3u\n8Z8MAN1xsMm361hzfD0oz35pgUvZeoAsFwqFzGbzhx9+eNVVVyldS3vdOordvn37448//uqr\nrwohdu3aJYTo06fPjBkzHn/88YKCgpTXKIRgpBiALFbNGDEA3ZN8xy5BluX6+nq32+10OtOz\nS9eZNI8UY8cOgIK84eg7B+vja4fJcP2AfGXrAZDJO3bJn7H74IMPGhoahBCSJPXt23fw4MGJ\nVLd169bXX389tQV2xGKxVFRUjBw58tJLL/X7/du3b6+urk5/GQCQBrSvA9B9yYPd+PHjN27c\n2OFHmzZtmjlzZk+X1KnNmzfPmTMn8fKVV14pKSm55JJLxo0bV1ZWNmLEiM7qBAD1OiPYOWlf\nB6ArnT5jt3///v3798fXO3futFja/zbx+/2vvvpq1619e9D69esnTpxoMpmWLFkiSdJf//rX\n6dOnOxyO2267LT8/f9++fe+9997111//4YcfpmfEGQCkQVMg7A5F4uteFqPDlPzBaADZrNPf\nEX/9619/+tOfxtcLFy7s7Gu33nprzxfVkQULFuTm5n744YfxfnI//vGPy8vLt2zZkphy9vHH\n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\nJcjgwYPdbncgEGjc2Ldv365duyqKolVVUFW1oqJizpw5oVBIVdXTBruz9h2dq6GZM2deeeWV\nse6LURTF4XD06tUrtkv3JbP777//vvvua9wSiURkWR40aFBsl+7ThUceeUSSpHfffbdJsKP7\nNME9dokQCAS+/PLL4cOH22y2xu2XXHJJWVlZUVGRVoVBCJGRkfH444/Lsnzao2ftOzpXW0uX\nLv3ggw8ad18oFIpEIj179hR0X9L77W9/+/DDDzduOXr0aDgc7t27t6D7dGL//v0PPvjglClT\nLr744sbtdJ9WCHaJcPjw4Wg0mpub26S9V69eQogDBw5oURRa5Kx9R+cmm1WrVoXD4ZtuuknQ\nfbri9/s3btw4atQot9v9m9/8RtB9OnHnnXd6PJ4lS5Y0aaf7tGLRuoBOoba2VgiRkpLSpN3l\ncsWPIjmdte/o3KSyadOmefPmXXLJJVOmTBF0n354PJ7q6mohxC233LJ+/fo+ffoIuk8PXnjh\nhX/9619//etf09LSvF5v40N0n1YIdokjSVKTFlVVT9uOZHPWvqNzk8Frr712++23DxgwYMOG\nDRbLyQ83ui/5/frXv66srPzPf/7z6quvHjx48MUXX4xlO0H3JbGysrI5c+Zcc80148aNO9M5\ndF/iEewSITU1VZzu74+amhohhNvt1qAmtMxZ+47OTQaqqj7wwAMPPfTQVVddtXr16viPne7T\ni/iFvI0bN15zzTU///nPd+7cSfcluRkzZoRCoeXLl5/2KN2nFYJdIuTl5VkslkOHDjVp379/\nvxCisLBQi6LQImftu+7du9O52lJVdfLkyc8999z06dOXLl0am0wrhu7Tncsvv3z06NGvvvrq\nvn37CgoK6L6k9e67777++usLFiwwmUzFxcXiRCDz+/3FxcWpqan89mlGo6dxO52LLrrI6XTW\n1dXFW6LRaHZ2dm5uroZVoYnTTndy1r6jc7U1Y8YMIcTDDz982qN0X9IqLi4eOHDghAkTmrSP\nHTtWCLFjxw6V7ktic+bMaSZazJ8/X6X7NMJTsQkyadIkv9//2GP3FFwzAAAG9klEQVSPxVv+\n+Mc/lpSUNFl9BUnorH1H52po3bp1y5YtmzFjxn333XfaE+i+pJWTk1NZWfnGG298+umn8cb/\n/e9///jHP1wu14ABAwTdl8QmTZr0t+96/fXXhRA//elP//a3v912222C7tOIpKqq1jV0CtFo\n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\nAAAAAElFTkSuQmCC"
          },
          "metadata": {
            "image/png": {
              "width": 420,
              "height": 420
            }
          }
        }
      ]
    }
  ]
}