# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/erubis/all/erubis.rbi
#
# erubis-2.7.0
module Kernel
  def not_implemented; end
end
module Erubis
end
module Erubis::Generator
  def add_expr_debug(src, code); end
  def add_expr_escaped(src, code); end
  def add_expr_literal(src, code); end
  def add_postamble(src); end
  def add_preamble(src); end
  def add_stmt(src, code); end
  def add_text(src, text); end
  def escape_text(text); end
  def escaped_expr(code); end
  def escapefunc; end
  def escapefunc=(arg0); end
  def init_generator(properties = nil); end
  def self.supported_properties; end
end
module Erubis::Converter
  def convert(input); end
  def convert_input(codebuf, input); end
  def detect_spaces_at_bol(text, is_bol); end
  def escape; end
  def escape=(arg0); end
  def init_converter(properties = nil); end
  def postamble; end
  def postamble=(arg0); end
  def preamble; end
  def preamble=(arg0); end
  def self.supported_properties; end
end
module Erubis::Basic
end
module Erubis::Basic::Converter
  def add_expr(src, code, indicator); end
  def convert_input(src, input); end
  def init_converter(properties = nil); end
  def pattern; end
  def pattern=(arg0); end
  def pattern_regexp(pattern); end
  def self.pattern_regexp(pattern); end
  def self.supported_properties; end
  def trim; end
  def trim=(arg0); end
  include Erubis::Converter
end
module Erubis::PI
end
module Erubis::PI::Converter
  def add_pi_expr(codebuf, code, indicator); end
  def add_pi_stmt(codebuf, code, pi_arg); end
  def convert(input); end
  def convert_input(codebuf, input); end
  def init_converter(properties = nil); end
  def pi; end
  def pi=(arg0); end
  def prefix; end
  def prefix=(arg0); end
  def self.desc; end
  def self.supported_properties; end
  include Erubis::Converter
end
class Erubis::ErubisError < StandardError
end
class Erubis::NotSupportedError < Erubis::ErubisError
end
class Erubis::Context
  def [](key); end
  def []=(key, value); end
  def each; end
  def initialize(hash = nil); end
  def keys; end
  def to_hash; end
  def update(context_or_hash); end
  include Enumerable
end
module Erubis::Evaluator
  def evaluate(*args); end
  def filename; end
  def filename=(arg0); end
  def init_evaluator(properties); end
  def result(*args); end
  def self.supported_properties; end
  def src; end
  def src=(arg0); end
end
module Erubis::RubyEvaluator
  def def_method(object, method_name, filename = nil); end
  def evaluate(_context = nil); end
  def result(_binding_or_hash = nil); end
  def self.supported_properties; end
  include Erubis::Evaluator
end
class Erubis::Engine
  def convert!(input); end
  def initialize(input = nil, properties = nil); end
  def process(input, context = nil, filename = nil); end
  def process_proc(proc_obj, context = nil, filename = nil); end
  def self.load_file(filename, properties = nil); end
end
class Erubis::Basic::Engine < Erubis::Engine
  include Erubis::Basic::Converter
  include Erubis::Evaluator
  include Erubis::Generator
end
class Erubis::PI::Engine < Erubis::Engine
  include Erubis::Evaluator
  include Erubis::Generator
  include Erubis::PI::Converter
end
module Erubis::XmlHelper
  def escape_xml(value); end
  def escape_xml2(value); end
  def h(value); end
  def html_escape(value); end
  def self.escape_xml(value); end
  def self.escape_xml2(value); end
  def self.url_encode(str); end
  def u(str); end
  def url_encode(str); end
end
module Erubis::EscapeEnhancer
  def add_expr(src, code, indicator); end
  def self.desc; end
end
module Erubis::StdoutEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::PrintOutEnhancer
  def add_expr_escaped(src, code); end
  def add_expr_literal(src, code); end
  def add_postamble(src); end
  def add_preamble(src); end
  def add_text(src, text); end
  def self.desc; end
end
module Erubis::PrintEnabledEnhancer
  def add_preamble(src); end
  def evaluate(context = nil); end
  def print(*args); end
  def self.desc; end
end
module Erubis::ArrayEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::ArrayBufferEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::StringBufferEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::StringIOEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::ErboutEnhancer
  def add_postamble(src); end
  def add_preamble(src); end
  def self.desc; end
end
module Erubis::NoTextEnhancer
  def add_text(src, text); end
  def self.desc; end
end
module Erubis::NoCodeEnhancer
  def add_expr(src, code, indicator); end
  def add_postamble(src); end
  def add_preamble(src); end
  def add_stmt(src, code); end
  def add_text(src, text); end
  def self.desc; end
end
module Erubis::SimplifyEnhancer
  def convert(input); end
  def self.desc; end
end
module Erubis::BiPatternEnhancer
  def add_text(src, text); end
  def bipattern=(pat); end
  def initialize(input, properties = nil); end
  def self.desc; end
end
module Erubis::PrefixedLineEnhancer
  def add_text(src, text); end
  def init_generator(properties = nil); end
  def self.desc; end
end
module Erubis::PercentLineEnhancer
  def add_text(src, text); end
  def self.desc; end
  include Erubis::PrefixedLineEnhancer
end
module Erubis::HeaderFooterEnhancer
  def add_text(src, text); end
  def convert(input); end
  def footer; end
  def footer=(arg0); end
  def header; end
  def header=(arg0); end
  def self.desc; end
end
module Erubis::DeleteIndentEnhancer
  def convert_input(src, input); end
  def self.desc; end
end
module Erubis::InterpolationEnhancer
  def _add_text_to_str(str, text); end
  def add_expr_escaped(str, code); end
  def add_expr_literal(str, code); end
  def add_text(src, text); end
  def convert_input(src, input); end
  def self.desc; end
end
module Erubis::RubyGenerator
  def add_expr_debug(src, code); end
  def add_expr_escaped(src, code); end
  def add_expr_literal(src, code); end
  def add_stmt(src, code); end
  def add_text(src, text); end
  def escape_text(text); end
  def escaped_expr(code); end
  def init_generator(properties = nil); end
  def self.supported_properties; end
  include Erubis::Generator
  include Erubis::StringBufferEnhancer
end
class Erubis::Eruby < Erubis::Basic::Engine
  include Erubis::RubyEvaluator
  include Erubis::RubyGenerator
end
class Erubis::FastEruby < Erubis::Eruby
  include Erubis::InterpolationEnhancer
end
class Erubis::EscapedEruby < Erubis::Eruby
  include Erubis::EscapeEnhancer
end
class Erubis::XmlEruby < Erubis::Eruby
  include Erubis::EscapeEnhancer
end
class Erubis::PI::Eruby < Erubis::PI::Engine
  def init_converter(properties = nil); end
  include Erubis::RubyEvaluator
  include Erubis::RubyGenerator
end
