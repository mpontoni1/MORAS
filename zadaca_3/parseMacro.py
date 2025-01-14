
def _parse_macros(self):
    self._iter_lines(self._parse_macro)

acc = "D=M"
sav = "M=D"
tmp = "@temp"
add = "D=D+M"

# MOVE
def _mv(self,A,B):
    return ['@'+A, acc, '@'+B, sav]
    

# SWAP
def _swp(self,A,B):
    return [tmp,"M=0",'@'+A, acc,tmp,sav, '@'+B,acc,'@'+A,sav,tmp,acc,'@'+B,sav]
    

#ADD

def _add(self,A,B,D):
    return ['@'+A,acc,'@'+B,add,'@'+D, sav]
     

# WHILE

def _while(self, A):
	self._nest += 1
	return ["(WHILE" + str(self._nest) + ")", "@" + A, acc, "@END" + str(self._nest), "D;JEQ"]


def _parse_macro(self, line, o, p):
	if line[0] == '$':
		command = line[1:].split('(')
		macro = command[0]
		
		if len(command) > 1:
			args = command[1]
			args_list = args.replace(")", "").split(",")
		
			if macro == "MV":
				return self._mv(args_list[0], args_list[1])
				
			
			elif macro == "SWP":
				return self._swp(args_list[0], args_list[1])

			
			elif macro == "ADD":
				return self._add(args_list[0], args_list[1], args_list[2])

			elif macro == "WHILE":
				return self._while(args_list[0])

			else:
				self._flag = False
				self._line = o
				self._errm = "kriva naredba " + macro
				return ""
		if macro == "END":
			lines = ["@WHILE" + str(self._nest), "0;JMP","(END" + str(self._nest) + ")"]
			self._nest -= 1
			return lines
	else:
		return line
	