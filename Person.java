
public class Person 
{
	private String Fornavn;
	private String Etternavn;
	private int alder;
	private int tlf;
	
	public void reg(String f, String e, int a, int t)
	{
		Fornavn = f;
		Etternavn = e;
		alder = a;
		tlf = t;
	}
	public String getFornavn()
	{
		return Fornavn;
	}
	public String getEtternavn()
	{
		return Etternavn;
	}
	public int getAlder()
	{
		return alder;
	}
	public int getTlf()
	{
		return tlf;
	}
	public String toString()
	{
		String utskrift = "Fornavn: " + Fornavn + "\nEtternavn: " + Etternavn + "\nAlder: " + alder 
				+ "\nTelefon: " + tlf + "\n";
		return utskrift;
	}
}
