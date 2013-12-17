---
title: "Lispy Abuse of Ruby: Local Functions"
layout: post
---

Functional languages like Lisp and Haskell make it easy to define highly
granular scopes. It's possible to define a local function, and restrict its
scope to any arbitrary chunk of code. In Lisp (Scheme), it looks like:

{% highlight scheme %}

(let ((fun1 (lambda () 1)))
  (list (fun1) ; first element
        (let ((fun2 (lambda () 2))) (fun2)) ; second element
        ))

;; => (list 1 2)

{% endhighlight %}

In this example, `fun1` is a helper method for building the list. And `fun2` is
even more restrictive in scope. `fun2` is only available for building the second
element of the list.

Closer to home, you can do the same in Javascript:

{% highlight javascript %}

(function () {
  function fun1() { return 1 };
  return [fun1(), (function () {
    function fun2() { return 2 };
    return fun2();
  })()];
})();

{% endhighlight %}

Unfortunately though, we need to create one anonymous function each time we want a
scope <a href="#better">[1]</a>.

In Ruby, this is as close as it gets,

{% highlight ruby %}

def test
 fun1 = lambda { 1 }
 fun2 = lambda { 2 }
 [fun1.(),fun2.()]
end

{% endhighlight %}

The scoping isn't right. And so clumsy. How can we do better?

# Bwahahahahahahahaha~~~~~

{% highlight ruby %}
def flet(&block)
  mod = Module.new
  mod.extend(mod)
  mod.module_eval(&block)
end
{% endhighlight %}

This allows you to do something like

{% highlight ruby %}
flet do
  def fun1
    1
  end
  [fun1,flet do
     def fun2
       2
     end
     fun2
   end]
end
{% endhighlight %}

__Exercise__: how do you make flet nestable? As in,

{% highlight ruby %}
flet do
  def fun1
    1
  end
  flet do
    def fun2
      2
    end
    [fun1,fun2]
  end
end
{% endhighlight %}

Note that in this example `fun1` is called in the scope of the inner flet.

Leave your answer in the comments ; )

<hr/>

<span id="better">[1]</span>
It looks much better in CoffeeScript:

{% highlight coffeescript %}
(->
 fun1 = -> 1
 [fun1(),(-> (fun2 = -> 2); fun2())()]
)
{% endhighlight%}

OK... maybe not much better.
