import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between bg-gradient-to-b from-[#4F46E5] to-[#EECDA3]">
      <div className="w-screen py-5">
        <p className="text-white font-bold text-2xl text-center mx-4">
          Welcome to the world of nfts
        </p>
        <div className="h-[.2px] w-screen bg-gray-50 my-3" />
        {/* You can remove the absolute positioning here */}
        {/* <div className="absolute top-0 right-0 h-52 w-52 rounded-full bg-gradient-to-t" /> */}
      </div>
    </main>
  );
}
