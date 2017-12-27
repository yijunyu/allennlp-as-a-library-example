# Security bugs classification through deep learning

## The [Chromium dataset](https://bitbucket.org/fayola21-lero/farsec47/src/eab43bb110e531c422b958989a22b5987c641ad4/resources/data/scrubbed/Chromium.csv?at=master) is inherited from the following paper:

Fayola Peters, Thein T. Tun, Yijun Yu, and Bashar Nuseibeh. "Text Filtering and Ranking for Security Bug Report Prediction", IEEE Trans. on Software Engineering, To Appear, 2017.

Note. Minor changes to `Chromium.csv` were applied so that JSON parser can accept the data (non-ASCII words removed).

## Script
```
./run
```

## The tutorial is inherited from [AllenNLP](https://github.com/allenai/allennlp-as-a-library-example)
A simple example for how to build your own model using AllenNLP as a dependency.  An explanation
of all of the code in this repository is given in an [AllenNLP
tutorial](https://github.com/allenai/allennlp/blob/master/tutorials/getting_started/using_in_your_repo.md).

There are two main pieces of code you need to write in order to make a new model: a
`DatasetReader` and a `Model`.  In this repository, we constructed a `DatasetReader` for reading
academic papers formatted as a JSON lines file (you can see an example of the data in
[`tests/fixtures/s2_papers.jsonl`](tests/fixtures/s2_papers.jsonl)).  We then constructed a model
to classify the papers given some label (which we specified as the paper's venue in the
`DatasetReader`).  Finally, we added a script to use AllenNLP's training commands from a
third-party repository, and an experiment configuration for running a real model on real data.

To train this model, after setting up your development environment by installing `allennlp==0.3`,
`pytorch==0.3`, and `spacy>=2.0`, you run:

```bash
python run.py train experiments/venue_classifier.json -s /tmp/your_output_dir_here
```

This example was written by the AllenNLP team.  You can see a similar example repository written
by others [here](https://github.com/recognai/get_started_with_deep_learning_for_text_with_allennlp).
