/*
 * -----------------------------------------------------------------
 * COMPANY : Ruhr University Bochum
 * AUTHOR  : Amir Moradi (amir.moradi@rub.de)
 * DOCUMENT: https://eprint.iacr.org/2021/
 * -----------------------------------------------------------------
 *
 * Copyright (c) 2021, David Knichel, Amir Moradi, Niolai Müller, Pascal Sasdrich
 *
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Please see LICENSE and README for license and further instructions.
 */


#include <string>

using namespace std;

double eval(string expr)
{
    string xxx; // Get Rid of Spaces
    for (unsigned int i = 0; i < expr.length(); i++)
    {
        if (expr[i] != ' ')
        {
            xxx += expr[i];
        }
    }

    string tok = ""; // Do parantheses first
    for (unsigned int i = 0; i < xxx.length(); i++)
    {
        if (xxx[i] == '(')
        {
            int iter = 1;
            string token;
            i++;
            while (true)
            {
                if (xxx[i] == '(')
                {
                    iter++;
                } else if (xxx[i] == ')')
                {
                    iter--;
                    if (iter == 0)
                    {
                        i++;
                        break;
                    }
                }
                token += xxx[i];
                i++;
            }
            //cout << "(" << token << ")" << " == " << to_string(eval(token)) <<  endl;
            tok += to_string(eval(token));
        }
        tok += xxx[i];
    }

	for (unsigned int i = 0; i < tok.length(); i++)
	{
		if (tok[i] == '!')
		{
			if ((tok[i + 1] == '-') || (tok[i + 1] == '+'))
				return !(eval(tok.substr(i + 2, tok.length() - i - 1)));
			else
				return !(eval(tok.substr(i + 1, tok.length() - i - 1)));
		}
	}

	for (unsigned int i = 0; i < tok.length(); i++)
	{
		if (tok[i] == '+')
		{
			//cout << tok.substr(0, i) + " + " +  tok.substr(i+1, tok.length()-i-1) << " == " << eval(tok.substr(0, i)) + eval(tok.substr(i+1, tok.length()-i-1)) << endl;
			return eval(tok.substr(0, i)) + eval(tok.substr(i + 1, tok.length() - i - 1));
		}
		else if (tok[i] == '-')
		{
			//cout << tok.substr(0, i) + " - " +  tok.substr(i+1, tok.length()-i-1) << " == " << eval(tok.substr(0, i)) - eval(tok.substr(i+1, tok.length()-i-1)) << endl;
			return eval(tok.substr(0, i)) - eval(tok.substr(i + 1, tok.length() - i - 1));
		}
	}

    for (unsigned int i = 0; i < tok.length(); i++)
    {
        if (tok[i] == '*')
        {
            //cout << tok.substr(0, i) + " * " +  tok.substr(i+1, tok.length()-i-1) << " == " << eval(tok.substr(0, i)) * eval(tok.substr(i+1, tok.length()-i-1)) << endl;
            return eval(tok.substr(0, i)) * eval(tok.substr(i+1, tok.length()-i-1));
        } else if (tok[i] == '/')
        {
            //cout << tok.substr(0, i) + " / " +  tok.substr(i+1, tok.length()-i-1) << " == " << eval(tok.substr(0, i)) / eval(tok.substr(i+1, tok.length()-i-1)) << endl;
            return eval(tok.substr(0, i)) / eval(tok.substr(i+1, tok.length()-i-1));
		}
    }

    //cout << stod(tok.c_str()) << endl;
    return stod(tok.c_str()); // Return the value...
}
