# :: or namespace resolution operator
# it allows to access items in modules
# or class-level items in class 
#
# Current using for assign things like user, timezone and etc
# purpose to keep assign attribute seperated from others and define things

class Current < ActiveSupport::CurrentAttributes
    attribute :user
end