package models.expression;

import utils.IDictionary;

public interface IExpression {
    public int eval(IDictionary<String, Integer> d);
}
