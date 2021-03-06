// Copyright (c) 2015 Andrew Sutton
// All rights reserved

#include "lexer.hpp"

#include <iostream>
#include <fstream>


// -------------------------------------------------------------------------- //
// Input buffer

Input_buffer::Input_buffer(File const& f)
  : file_(&f)
{
  std::ifstream is(f.path().c_str());
  buf_.assign(is);
  pos_ = buf_.begin();
  last_ = pos_;
}



// Returns the current character and advances the
// stream.
char
Input_buffer::get()
{
  if (eof())
    return 0;

  if (*pos_ == '\n') {
    lines_.emplace(offset(), Line(lines_.size() + 1, last_, pos_));
    last_ = pos_ + 1;
  }

  return *pos_++;
}


// -------------------------------------------------------------------------- //
// Lexer

// Returns the next token in the character stream.
// If no next token can be identified, an error
// is emitted and we return the error token.
Token
Lexer::scan()
{
  // Keep consuming characters until we find
  // a token.
  while (true) {
    space();

    // Update the position of the current source location.
    // This denotes the beginning of the current token.
    loc_ = in_.location();

    switch (peek()) {
      case 0: return eof();

      case '{': return lbrace();
      case '}': return rbrace();
      case '(': return lparen();
      case ')': return rparen();
      case '[': return lbrack();
      case ']': return rbrack();
      case ',': return comma();
      case ':': return colon();
      case ';': return semicolon();
      case '.': return dot();
      case '+': return plus();
      case '-': return minus();
      case '*': return star();

      case '/':
        get();
        if (peek() == '/') {
          comment();
          continue;
        } else {
          return slash();
        }

      case '%': return percent();
      case '=': return equal();
      case '!': return bang();
      case '<': return langle();
      case '>': return rangle();
      case '&': return ampersand();
      case '|': return bar();

      case '0': case '1': case '2': case '3': case '4':
      case '5': case '6': case '7': case '8': case '9':
        return integer();

      case 'a': case 'b': case 'c': case 'd': case 'e':
      case 'f': case 'g': case 'h': case 'i': case 'j':
      case 'k': case 'l': case 'm': case 'n': case 'o':
      case 'p': case 'q': case 'r': case 's': case 't':
      case 'u': case 'v': case 'w': case 'x': case 'y':
      case 'z':
      case 'A': case 'B': case 'C': case 'D': case 'E':
      case 'F': case 'G': case 'H': case 'I': case 'J':
      case 'K': case 'L': case 'M': case 'N': case 'O':
      case 'P': case 'Q': case 'R': case 'S': case 'T':
      case 'U': case 'V': case 'W': case 'X': case 'Y':
      case 'Z':
        return word();

      default:
        return error();
    }
  }
}


// Get the matched character and return a token.
// Note that the symbol for this token must have
// been previously installed in the symbol table.
inline Token
Lexer::on_token()
{
  Symbol const* sym = syms_.get(build_.take());
  return Token(loc_, sym->token(), sym);
}


// Returns a new keyword token.
inline Token
Lexer::on_word()
{
  String str = build_.take();

  // Try looking up the symbol first. If there is no such
  // symbol, then this must be an identifier.
  Symbol const* sym = syms_.get(str);
  if (!sym)
    sym = syms_.put<Identifier_sym>(str, identifier_tok);

  return Token(loc_, sym->token(), sym);
}


// Return a new integer token.
inline Token
Lexer::on_integer()
{
  String str = build_.take();
  int n = string_to_int<int>(str, 10);
  Symbol* sym = syms_.put<Integer_sym>(str, integer_tok, n);
  return Token(loc_, integer_tok, sym);
}


void
Lexer::comment()
{
  get();
  while (true) {
    char c = peek();
    if (!c || is_newline(c))
      break;
    get();
  }

  // TODO: Do something interesting with comments
  // instead of just discarding them.
  build_.clear();
}


// Consume horizontal and vertical whitespace.
//
// TODO: Build and maintain a map of location-to-comment.
// We should be able to use this for documentation generation
// at a future time.
void
Lexer::space()
{
  while (true) {
    char c = peek();
    if (is_space(c))
      ignore();
    else if (is_newline(c))
      ignore();
    else
      break;
  }
}


// Set the error flag and return an invalid token.
// This also consumes the current character so that
// we can continue lexing.
inline Token
Lexer::error()
{
  state_ |= error_flag;

  // Actually save the character into the accumulator
  // so we can diagnose exactly what the invalid symbol
  // was.
  get();

  // TODO: Improve diagnostics.
  std::cerr << "error:" << loc_ << ": invalid symbol '" << build_.take() << "'\n";

  return Token();
}
