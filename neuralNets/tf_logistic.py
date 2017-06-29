import tensorflow as tf
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.datasets import load_digits
from sklearn import preprocessing

''' testing

y = tf.placeholder(tf.float32)
x = tf.placeholder(tf.float32)

add_node = x + y


with tf.Session() as sess:
    writer = tf.summary.FileWriter('./graphs, sess.graph')
    print(sess.run(add_node, {x: 3, y: 4.5}))
    writer.flush()
    writer.close()

# to run
# terminal -> python3 tf_logistic.py
# terminal -> tensorboard --logdir="./graphs" --port 6006

'''

digits = load_digits()

def one_hot(n_classes, y):
    return np.eye(n_classes)[y]


data = np.asarray(digits.data, dtype='float32')
target = np.asarray(digits.target, dtype='int32')


X_train, X_test, y_train, y_test = train_test_split(
    data, target, test_size=0.15, random_state=37)

# Normalise the images
scaler = preprocessing.StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

Y_test = one_hot(10, y_test)
Y_train = one_hot(10, y_train)

def init_weights(shape, name):
    return tf.Variable(tf.random_normal(shape, stddev=0.01), name=name)


def accuracy(y_pred, y=y_test):
    return np.mean(np.argmax(y_pred, axis=1) == y)

# hyperparams
batch_size = 32
hid_size = 15
learning_rate = 0.01
num_epochs = 15
input_size = X_train.shape[1]
output_size = 10

# input and output
X = tf.placeholder("float32", shape=[None, input_size], name='input')
y = tf.placeholder("int32", shape=[None], name='true_labels')

# the model and weights
W_h = init_weights([input_size, hid_size], name='W_h')
b_h = init_weights([hid_size], name='b_h')
W_o = init_weights([hid_size, output_size], name='W_o')
b_o = init_weights([output_size], name='b_o')
h = tf.nn.sigmoid(tf.matmul(X, W_h) + b_h)
out_act = tf.matmul(h, W_o) + b_o

# the loss and train operator
cross_entropy = tf.nn.sparse_softmax_cross_entropy_with_logits(logits=out_act, labels=y)
loss = tf.reduce_sum(cross_entropy, name='loss')

optimizer = tf.train.GradientDescentOptimizer(learning_rate)
train_op = optimizer.minimize(loss)

# predict node
predict = tf.nn.softmax(out_act)

# Initialization of all variables in the graph
init = tf.global_variables_initializer()

# run the training
with tf.Session() as sess:
    sess.run(init)

    losses = []
    for e in range(num_epochs):
        for i in range(X_train.shape[0] // batch_size):
            # batches of batch_size
            idx, idxn = i * batch_size, min(X_train.shape[0] - 1, (i + 1) * batch_size)
            batch_xs, batch_ys = X_train[idx: idxn], y_train[idx: idxn]

            # Run train operator and monitor loss
            _, l = sess.run([train_op, loss], feed_dict={X: batch_xs, y: batch_ys})
            losses.append(l)

        # For each epoch, run accuracy on train and test
        predicts_test = sess.run(predict, feed_dict={X: X_test})
        predicts_train = sess.run(predict, feed_dict={X: X_train})
        print("epoch: %d train accuracy: %0.3f test accuracy: %0.3f"
              % (e, accuracy(predicts_train, y_train), accuracy(predicts_test)))

    # For monitoring purposes
    file_writer = tf.summary.FileWriter('./tensorflow_summaries', sess.graph)

